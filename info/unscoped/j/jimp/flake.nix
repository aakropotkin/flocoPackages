{

  inputs.packument.url   = "https://registry.npmjs.org/jimp?rev=339-5616b4eba0d0a397b01e635b8655fd42";
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
    ident = "jimp";
    ldir  = "info/unscoped/j/jimp";
    inherit packument fetchInfo;
  } // latest';

}
