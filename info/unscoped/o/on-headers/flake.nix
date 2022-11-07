{

  inputs.packument.url   = "https://registry.npmjs.org/on-headers?rev=20-88b3231da85207e4fbec0cb2b16a369a";
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
    ident = "on-headers";
    ldir  = "info/unscoped/o/on-headers";
    inherit packument fetchInfo;
  } // latest';

}
