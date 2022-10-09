{
  inputs = {
    packument = {
      type  = "file";
      url   = "https://registry.npmjs.org/nan";
      flake = false;
    };
  };

  outputs = { packument, ... } @ inputs: let
    lib.importJSON = f: builtins.fromJSON ( builtins.readFile f );
  in {
    packument = lib.importJSON inputs.packument;
  };

}
