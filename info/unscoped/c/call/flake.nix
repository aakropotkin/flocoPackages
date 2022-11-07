{

  inputs.packument.url   = "https://registry.npmjs.org/call?rev=83-3a91e33926baa1b9b87e19fc93ab8b4b";
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
    ident = "call";
    ldir  = "info/unscoped/c/call";
    inherit packument fetchInfo;
  } // latest';

}
