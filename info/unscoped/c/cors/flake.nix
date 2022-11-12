{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/cors?_rev=373-b1aec3708cc14bcc9b5bc18cb6f5d2a5";
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
    ident = "cors";
    ldir  = "info/unscoped/c/cors";
    inherit packument fetchInfo;
  } // latest';

}
