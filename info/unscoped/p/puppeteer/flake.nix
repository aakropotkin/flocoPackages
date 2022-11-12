{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/puppeteer?_rev=954-0a517ea4b918984f7a64bed10d096bff";
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
    ident = "puppeteer";
    ldir  = "info/unscoped/p/puppeteer";
    inherit packument fetchInfo;
  } // latest';

}
