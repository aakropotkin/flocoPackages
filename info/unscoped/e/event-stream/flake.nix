{

  inputs.packument.url   = "https://registry.npmjs.org/event-stream?rev=290-f45f60a9aaf4af8504550be88e17eec2";
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
    ident = "event-stream";
    ldir  = "info/unscoped/e/event-stream";
    inherit packument fetchInfo;
  } // latest';

}
