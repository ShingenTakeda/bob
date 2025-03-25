import std.stdio;
import env_check;
import bob_config;

void main(string[] args)
{
  writeln(check_compilers_on_env.get_compilers_path());
  print_bob_env();

  bob_env();
}
