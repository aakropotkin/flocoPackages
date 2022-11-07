{

  inputs.packument.url   = "https://registry.npmjs.org/extsprintf?rev=58-2ede7ee72cd6118c7c3682bf6d056a30";
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
    ident = "extsprintf";
    ldir  = "info/unscoped/e/extsprintf";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
