import std.stdio;
import env_check;
import bob_config;

void main(string[] args)
{
  writeln(get_bob_directory());
  bob_create_env();

  bob_create_compiler_own_env();
}
