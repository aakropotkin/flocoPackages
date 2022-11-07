{

  inputs.packument.url   = "https://registry.npmjs.org/crc-32?rev=24-0cc309085683097d7ab1342491d55d57";
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
    ident = "crc-32";
    ldir  = "info/unscoped/c/crc-32";
    inherit packument fetchInfo;
  } // latest';

}
