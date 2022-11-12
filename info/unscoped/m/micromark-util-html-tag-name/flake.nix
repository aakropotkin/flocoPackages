{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/micromark-util-html-tag-name?_rev=6-210c624a7adebb0cb2f657a65d876ea5";
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
    ident = "micromark-util-html-tag-name";
    ldir  = "info/unscoped/m/micromark-util-html-tag-name";
    inherit packument fetchInfo;
  } // latest';

}
