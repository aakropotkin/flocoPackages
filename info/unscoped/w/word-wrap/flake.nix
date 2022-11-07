{

  inputs.packument.url   = "https://registry.npmjs.org/word-wrap?rev=33-3027e8193ed18279beb28b98eadd41a9";
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
    ident = "word-wrap";
    ldir  = "info/unscoped/w/word-wrap";
    inherit packument fetchInfo;
  } // latest';

}
