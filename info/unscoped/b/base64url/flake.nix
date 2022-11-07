{

  inputs.packument.url   = "https://registry.npmjs.org/base64url?rev=55-05cabc2e8dbb686c412668b587bd0950";
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
    ident = "base64url";
    ldir  = "info/unscoped/b/base64url";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
