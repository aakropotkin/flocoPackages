{

  inputs.packument.url   = "https://registry.npmjs.org/event-emitter?rev=68-07cba7e81b8297ce61233f9f6fd13454";
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
    ident = "event-emitter";
    ldir  = "info/unscoped/e/event-emitter";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
