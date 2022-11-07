{

  inputs.packument.url   = "https://registry.npmjs.org/adler-32?rev=18-3d763fff1f58e63b25cb8ffe477607b9";
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
    ident = "adler-32";
    ldir  = "info/unscoped/a/adler-32";
    inherit packument fetchInfo;
  } // latest';

}
