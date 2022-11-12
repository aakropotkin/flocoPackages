{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/istextorbinary?_rev=96-f947aef8600379547d66adb8fae4ec07";
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
    ident = "istextorbinary";
    ldir  = "info/unscoped/i/istextorbinary";
    inherit packument fetchInfo;
  } // latest';

}
