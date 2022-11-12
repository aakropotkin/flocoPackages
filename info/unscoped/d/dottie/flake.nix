{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/dottie?_rev=69-4b91a31a6bf2e5786cf4470131a011ac";
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
    ident = "dottie";
    ldir  = "info/unscoped/d/dottie";
    inherit packument fetchInfo;
  } // latest';

}
