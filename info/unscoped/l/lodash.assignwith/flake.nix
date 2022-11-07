{

  inputs.packument.url   = "https://registry.npmjs.org/lodash.assignwith?rev=15-d405ad7e4b8d13c0b63474f9e3a3b3dc";
  inputs.packument.flake = false;

  outputs = inputs: let
    importJSON = f: builtins.fromJSON ( builtins.readFile f );
    packument  = importJSON inputs.packument;
    fetchInfo  = if ! builtins.pathExists ./fetchInfo.json then {} else
                 importJSON ./fetchInfo.json;
    latest'    = if ! ( packument ? dist-tags.latest ) then {} else {
      latestVersion = packument.dist-tags.latest;
      latest        = packument.versions.${packument.dist-tags.latest};
    };
  in {
    scope = null;
    ident = "lodash.assignwith";
    ldir  = "info/unscoped/l/lodash.assignwith";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
