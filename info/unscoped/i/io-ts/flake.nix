{

  inputs.packument.url   = "https://registry.npmjs.org/io-ts?rev=129-231528b9ecde21e6bab1f013216c7ef7";
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
    ident = "io-ts";
    ldir  = "info/unscoped/i/io-ts";
    inherit packument fetchInfo;
  } // latest';

}
