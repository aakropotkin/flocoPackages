{

  inputs.packument.url   = "https://registry.npmjs.org/jest-worker?rev=171-08aa5a8b1cd79f373d7a17f6c42e9010";
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
    ident = "jest-worker";
    ldir  = "info/unscoped/j/jest-worker";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
