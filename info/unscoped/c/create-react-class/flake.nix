{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/create-react-class?_rev=65-e5d20f0778489758119cd90215cb9afc";
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
    ident = "create-react-class";
    ldir  = "info/unscoped/c/create-react-class";
    inherit packument fetchInfo;
  } // latest';

}
