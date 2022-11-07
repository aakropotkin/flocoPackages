{

  inputs.packument.url   = "https://registry.npmjs.org/jsrsasign?rev=168-5bd51db98e6bb4e06fb6369640c5138a";
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
    ident = "jsrsasign";
    ldir  = "info/unscoped/j/jsrsasign";
    inherit packument fetchInfo;
  } // latest';

}
