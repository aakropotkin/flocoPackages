{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@wry/context?_rev=26-b3c87a15401e1de72d34af9dc3966ba4";
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
    scope = "@wry";
    ident = "@wry/context";
    ldir  = "info/wry/context";
    inherit packument fetchInfo;
  } // latest';

}
