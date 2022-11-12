{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/electron-to-chromium?_rev=1206-b726de3fd9b83c4e7dc577b6ee5d9658";
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
    ident = "electron-to-chromium";
    ldir  = "info/unscoped/e/electron-to-chromium";
    inherit packument fetchInfo;
  } // latest';

}
