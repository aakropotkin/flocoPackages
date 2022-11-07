{

  inputs.packument.url   = "https://registry.npmjs.org/string-convert?rev=8-956c60ffbd5940e510618f6839bdc8cf";
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
    ident = "string-convert";
    ldir  = "info/unscoped/s/string-convert";
    inherit packument fetchInfo;
  } // latest';

}
