{

  inputs.packument.url   = "https://registry.npmjs.org/passport-oauth?rev=57-11b10c7532c08f1241e5a3b972a059e5";
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
    ident = "passport-oauth";
    ldir  = "info/unscoped/p/passport-oauth";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
