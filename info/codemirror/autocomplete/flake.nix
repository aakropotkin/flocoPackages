{

  inputs.packument.url   = "https://registry.npmjs.org/@codemirror/autocomplete?rev=43-345268f804978e2872143ef8e34b6207";
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
    scope = "@codemirror";
    ident = "@codemirror/autocomplete";
    ldir  = "info/codemirror/autocomplete";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
