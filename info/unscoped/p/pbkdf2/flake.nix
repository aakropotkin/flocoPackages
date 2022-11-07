{

  inputs.packument.url   = "https://registry.npmjs.org/pbkdf2?rev=58-a4eac56b23167c5f3ac5852e819dc9dc";
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
    ident = "pbkdf2";
    ldir  = "info/unscoped/p/pbkdf2";
    inherit packument fetchInfo;
  } // latest';

}
