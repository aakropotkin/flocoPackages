{

  inputs.packument.url   = "https://registry.npmjs.org/yargs-parser?rev=105-5b0f48c9ae32d369ebb42f2c30e585dc";
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
    ident = "yargs-parser";
    ldir  = "info/unscoped/y/yargs-parser";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
