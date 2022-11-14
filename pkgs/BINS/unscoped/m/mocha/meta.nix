{ version }: {

  bin = if 0 < ( builtins.compareVersions "10" version ) then {
    mocha  = "bin/mocha";
    _mocha = "bin/_mocha";
  } else {
    mocha  = "bin/mocha.js";
    _mocha = "bin/_mocha";
  };

}
