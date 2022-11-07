{

  inputs.packument.url   = "https://registry.npmjs.org/har-validator?rev=76-d62a626346ce15241a8a5355e59999e7";
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
    ident = "har-validator";
    ldir  = "info/unscoped/h/har-validator";
    inherit packument fetchInfo;
  } // latest';

}
