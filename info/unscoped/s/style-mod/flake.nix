{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/style-mod?_rev=19-00962d9770064e79fc8bcc8bc9849bfd";
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
    ident = "style-mod";
    ldir  = "info/unscoped/s/style-mod";
    inherit packument fetchInfo;
  } // latest';

}
