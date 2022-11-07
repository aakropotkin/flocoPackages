{

  inputs.packument.url   = "https://registry.npmjs.org/passport-oauth2?rev=41-187ce08851df2f19e838b34ef73811d0";
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
    ident = "passport-oauth2";
    ldir  = "info/unscoped/p/passport-oauth2";
    inherit packument fetchInfo;
  } // latest';

}
