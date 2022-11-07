{

  inputs.packument.url   = "https://registry.npmjs.org/abab?rev=17-cf7b4b91cefeb811f9a4b10803d970c5";
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
    ident = "abab";
    ldir  = "info/unscoped/a/abab";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
