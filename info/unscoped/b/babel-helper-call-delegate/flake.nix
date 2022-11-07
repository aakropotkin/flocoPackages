{

  inputs.packument.url   = "https://registry.npmjs.org/babel-helper-call-delegate?rev=92-84774b24ee975f0a30442a9c66d9b969";
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
    ident = "babel-helper-call-delegate";
    ldir  = "info/unscoped/b/babel-helper-call-delegate";
    inherit packument fetchInfo;
  } // latest';

}
