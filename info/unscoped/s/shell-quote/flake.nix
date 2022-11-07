{

  inputs.packument.url   = "https://registry.npmjs.org/shell-quote?rev=54-d3de4a94640177f1cc3e6f6c6524b3bd";
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
    ident = "shell-quote";
    ldir  = "info/unscoped/s/shell-quote";
    inherit packument fetchInfo;
  } // latest';

}
