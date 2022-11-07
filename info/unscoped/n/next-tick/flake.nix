{

  inputs.packument.url   = "https://registry.npmjs.org/next-tick?rev=21-81d593f5ab7710620e7bccb7f33e618b";
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
    ident = "next-tick";
    ldir  = "info/unscoped/n/next-tick";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
