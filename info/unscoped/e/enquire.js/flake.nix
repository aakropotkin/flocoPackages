{

  inputs.packument.url   = "https://registry.npmjs.org/enquire.js?rev=21-825dd639e992d9e6da83a391f483bb8a";
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
    ident = "enquire.js";
    ldir  = "info/unscoped/e/enquire.js";
    inherit packument fetchInfo;
  } // latest';

}
