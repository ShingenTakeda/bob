import std.stdio;
import std.process;
import std.typecons : Tuple, tuple;

Tuple!(bool, bool) check_compilers_on_env()
{
  bool zig_in_path;
  bool tcc_in_path;

  auto zig_status = executeShell("zig env");
  if (zig_status.status != 0)
  {
    writeln("zig not in path:\n", zig_status.output);
    zig_in_path = false;
  }
  else
  {
    zig_in_path = true;
  }

  auto tcc_status = executeShell("tcc");
  if (tcc_status.status != 0)
  {
    writeln("tcc not in path\n", tcc_status.output);
    tcc_in_path = false;
  }
  else
  {
    tcc_in_path = true;
  }

  return tuple(zig_in_path, tcc_in_path);
}

Tuple!(bool, bool) check_bob_compilers()
{
  bool zig_in_path;
  bool tcc_in_path;

  return tuple(zig_in_path, tcc_in_path);
}

Tuple!(string, string) get_compilers_path(Tuple!(bool, bool) compilers_in_env)
{
  string zig_path;
  string tcc_path;
  if (compilers_in_env[0] == true)
  {
    version (Windows)
    {
      auto zig_status = executeShell("where zig");
      if (zig_status.status != 0)
      {
        writeln("zig not in path:\n", zig_status.output);
        zig_path = "";
      }

      auto tcc_status = executeShell("where tcc");
      if (zig_status.status != 0)
      {
        writeln("tcc not in path:\n", tcc_status.output);
        tcc_path = "";
      }
    }
    version (linux)
    {
      auto zig_status = executeShell("which zig");
      if (zig_status.status != 0)
      {
        writeln("zig not in path:\n", zig_status.output);
        zig_path = "";
      }
      else
      {
        zig_path = zig_status.output;
      }

      auto tcc_status = executeShell("which tcc");
      if (tcc_status.status != 0)
      {
        writeln("tcc not in path:\n", tcc_status.output);
        tcc_path = "";
      }
      else
      {
        tcc_path = tcc_status.output;
      }
    }
  }

  return tuple(zig_path, tcc_path);
}

//Tuple!(string, string) get_bob_compilers_path(Tuple!(bool, bool) compilers_in_env)
//{
//
//}
