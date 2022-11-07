{

  inputs.packument.url   = "https://registry.npmjs.org/strip-comments?rev=42-f5153591227ef67baa227975c37d22c2";
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
    ident = "strip-comments";
    ldir  = "info/unscoped/s/strip-comments";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
