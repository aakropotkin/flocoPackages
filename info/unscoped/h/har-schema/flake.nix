{

  inputs.packument.url   = "https://registry.npmjs.org/har-schema?rev=15-5e5b75473ea06e6e55e85625a7350f7e";
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
    ident = "har-schema";
    ldir  = "info/unscoped/h/har-schema";
    inherit packument fetchInfo;
  } // latest';

}
