{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/puppeteer-core?_rev=180-3be38ef77942ef112154b18fe4f26d69";
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
    ident = "puppeteer-core";
    ldir  = "info/unscoped/p/puppeteer-core";
    inherit packument fetchInfo;
  } // latest';

}
