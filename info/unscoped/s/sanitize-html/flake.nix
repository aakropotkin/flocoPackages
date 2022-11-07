{

  inputs.packument.url   = "https://registry.npmjs.org/sanitize-html?rev=279-5e458b10a8ead5f0d271d25ca0232312";
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
    ident = "sanitize-html";
    ldir  = "info/unscoped/s/sanitize-html";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
