{

  inputs.packument.url   = "https://registry.npmjs.org/webidl-conversions?rev=27-c603cc712d28b132e19d39c2a57cf18f";
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
    ident = "webidl-conversions";
    ldir  = "info/unscoped/w/webidl-conversions";
    inherit packument fetchInfo;
  } // latest';

}
