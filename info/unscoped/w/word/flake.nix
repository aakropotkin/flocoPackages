{

  inputs.packument.url   = "https://registry.npmjs.org/word?rev=23-00369c3f8aa8181d4fc250127cc5b797";
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
    ident = "word";
    ldir  = "info/unscoped/w/word";
    inherit packument fetchInfo;
  } // latest';

}
