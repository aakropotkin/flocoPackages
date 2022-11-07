{

  inputs.packument.url   = "https://registry.npmjs.org/queue-microtask?rev=11-812d80a7f1154bac10a622fd0adef4e3";
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
    ident = "queue-microtask";
    ldir  = "info/unscoped/q/queue-microtask";
    inherit packument fetchInfo;
  } // latest';

}
