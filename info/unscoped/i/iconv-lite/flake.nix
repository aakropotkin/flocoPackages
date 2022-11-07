{

  inputs.packument.url   = "https://registry.npmjs.org/iconv-lite?rev=213-d18e9f56f70305efca7563d6f41e039e";
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
    ident = "iconv-lite";
    ldir  = "info/unscoped/i/iconv-lite";
    inherit packument fetchInfo;
  } // latest';

}
