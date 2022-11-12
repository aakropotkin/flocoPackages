{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/mem-fs-editor?_rev=56-28da681313a22c729a1b5cbc85e27dd3";
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
    ident = "mem-fs-editor";
    ldir  = "info/unscoped/m/mem-fs-editor";
    inherit packument fetchInfo;
  } // latest';

}
