{

  inputs.packument.url   = "https://registry.npmjs.org/cmd-shim?rev=62-f6c536a973f944783dd494593c52db8c";
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
    ident = "cmd-shim";
    ldir  = "info/unscoped/c/cmd-shim";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
