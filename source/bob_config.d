import std.stdio;
import std.file;
import std.json;
import std.string;
import env_check;

string get_bob_directory()
{
  return getcwd();
}

void print_bob_env()
{
  writeln(get_bob_directory());
}

void bob_env()
{
  JSONValue bob_env = ["bob_version": "0.01"];
  auto compiler_paths = check_compilers_on_env.get_compilers_path();

  bob_env.object["bob_path"] = JSONValue(get_bob_directory.chop());
  bob_env.object["zig_path"] = JSONValue(compiler_paths[0].chop());
  bob_env.object["tcc_path"] = JSONValue(compiler_paths[1].chop());

  writeln(bob_env.toString);

  File bob_env_file = File("bob_env.json", "wr");

  bob_env_file.write(bob_env.toString());

  bob_env_file.close();
}
