{

  inputs.packument.url   = "https://registry.npmjs.org/eastasianwidth?rev=10-72ec470e2a20334a5121f73db5e12884";
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
    ident = "eastasianwidth";
    ldir  = "info/unscoped/e/eastasianwidth";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
