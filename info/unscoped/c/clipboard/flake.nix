{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/clipboard?_rev=141-821264fff6902ac7d265beda9c6e0015";
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
    ident = "clipboard";
    ldir  = "info/unscoped/c/clipboard";
    inherit packument fetchInfo;
  } // latest';

}
