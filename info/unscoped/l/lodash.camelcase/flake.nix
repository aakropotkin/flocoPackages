{

  inputs.packument.url   = "https://registry.npmjs.org/lodash.camelcase?rev=19-bce2c962bb609e6c2eb2b0dc6b8fa293";
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
    ident = "lodash.camelcase";
    ldir  = "info/unscoped/l/lodash.camelcase";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
