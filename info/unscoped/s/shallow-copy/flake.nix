{

  inputs.packument.url   = "https://registry.npmjs.org/shallow-copy?rev=11-0faa27d67729f18c72580d461ece8555";
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
    ident = "shallow-copy";
    ldir  = "info/unscoped/s/shallow-copy";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
