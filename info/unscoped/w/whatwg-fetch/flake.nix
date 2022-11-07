{

  inputs.packument.url   = "https://registry.npmjs.org/whatwg-fetch?rev=196-29ab4fdb0c97fe2ca131f33df64ca037";
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
    ident = "whatwg-fetch";
    ldir  = "info/unscoped/w/whatwg-fetch";
    inherit packument fetchInfo;
  } // latest';

}
