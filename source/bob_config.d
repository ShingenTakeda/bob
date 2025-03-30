import std.stdio;

import std.file;
import std.json;
import std.string;
import env_check;

enum COMP_CHECKS
{
  DEBUG,
  RELEASE
}

debug = DEBUG;

string get_bob_directory()
{
  return thisExePath();
}

void print_bob_env()
{
  writeln(get_bob_directory());
}

void bob_create_env()
{
  string bob_env_path = get_bob_directory().replace("build/bob", "build/bob_env.json");
  JSONValue bob_env = ["bob_version": "0.01"];
  auto compiler_paths = check_compilers_on_env.get_compilers_path();

  bob_env.object["bob_path"] = JSONValue(get_bob_directory);
  bob_env.object["zig_path"] = JSONValue(compiler_paths[0].chop());
  bob_env.object["tcc_path"] = JSONValue(compiler_paths[1].chop());
  bob_env.object["bob_zig"] = JSONValue("");
  bob_env.object["bob_tcc"] = JSONValue("");

  writeln(bob_env.toString);

  File bob_env_file = File(bob_env_path, "wr");

  bob_env_file.write(bob_env.toString());

  bob_env_file.close();
}

void bob_get_env()
{

}

void bob_create_compiler_own_env()
{
  bool bob_zig = true;
  bool bob_tcc = true;
  string bob_path;
  bob_path = get_bob_directory().replace("build/bob", "build/");
  string zig_dir = bob_path ~ "bob_zig";
  string tcc_dir = bob_path ~ "bob_tcc";

  auto bob_dir_entries = dirEntries(bob_path, SpanMode.breadth);

  foreach (name; bob_dir_entries)
  {
    writeln(name);
    if (name == bob_path ~ "bob_zig")
    {
      bob_zig = false;
    }
    if (name == bob_path ~ "bob_tcc")
    {
      bob_tcc = false;
    }
  }

  if (bob_zig == true)
  {
    zig_dir.mkdir;
  }

  if (bob_tcc == true)
  {
    tcc_dir.mkdir;
  }
}
